import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_supplier/core/models/event_type.dart';
import 'package:uplanit_supplier/core/utils/custom_colors.dart';
import 'package:uplanit_supplier/core/viewmodels/event_type_provider.dart';
import 'package:uplanit_supplier/ui/views/all_done.dart';


class EventTypeDialog extends StatelessWidget {
  const EventTypeDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        height: 540,
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 42,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'One last step',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        'What events will you be supplying for?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.workSans(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: EventTypeView(),
                    )
                  ],
                ),
              ),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop(false)),
                FlatButton(
                    child: Text('FINISH'),
                    onPressed: () =>
                        Navigator.pushNamed(context, AllDone.ROUTE)),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class EventTypeView extends StatefulWidget {
  EventTypeView({Key key}) : super(key: key);

  @override
  _EventTypeViewState createState() => _EventTypeViewState();
}

class _EventTypeViewState extends State<EventTypeView> {
  EventTypeProvider _eventTypeProvider;
  @override
  void initState() {
    context.read<EventTypeProvider>().loadEventType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _eventTypeProvider = Provider.of(context);
    List<EventType> _list = _eventTypeProvider.eventTypeList;
    bool isEventTypeLoading = _eventTypeProvider.isEventTypeLoading;

    return isEventTypeLoading
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            shrinkWrap: true,
            itemCount: _list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) => _buildItem(
                  context,
                  index,
                ));
  }

  _buildItem(BuildContext context, int index) {
    return Opacity(
      opacity: 0.4,
      child: Container(
        width: 106,
        height: 108,
        decoration: BoxDecoration(
          color: CustomColor.uplanitBlue,
        ),
      ),
    );
  }
}
