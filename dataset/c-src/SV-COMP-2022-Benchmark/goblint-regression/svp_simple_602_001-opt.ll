; ModuleID = 'svp_simple_602_001-opt.bc'
source_filename = "./svp_simple_602_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A = global i32 5, align 4
@B = global i32 5, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = icmp ne i32 %0, 0, !dbg !13
  br i1 %2, label %6, label %3, !dbg !14

3:                                                ; preds = %1
  br label %4, !dbg !15

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !16
  call void @abort() #5, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i8* @generate(i8* %0) #0 !dbg !20 {
  br label %2, !dbg !21

2:                                                ; preds = %6, %1
  %.0 = phi i32 [ 1, %1 ], [ %7, %6 ], !dbg !22
  %3 = icmp slt i32 %.0, 100, !dbg !23
  br i1 %3, label %4, label %8, !dbg !24

4:                                                ; preds = %2
  store i32 %.0, i32* @A, align 4, !dbg !25, !tbaa !26
  store i32 5, i32* @A, align 4, !dbg !30, !tbaa !26
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !31
  br label %6, !dbg !32

6:                                                ; preds = %4
  %7 = add nsw i32 %.0, 1, !dbg !33
  br label %2, !dbg !24, !llvm.loop !34

8:                                                ; preds = %2
  ret i8* undef, !dbg !35
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @sleep(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i8* @process(i8* %0) #0 !dbg !36 {
  br label %2, !dbg !37

2:                                                ; preds = %1, %15
  %3 = load i32, i32* @A, align 4, !dbg !38, !tbaa !26
  %4 = icmp sgt i32 %3, 0, !dbg !39
  br i1 %4, label %5, label %13, !dbg !38

5:                                                ; preds = %2
  %6 = load i32, i32* @A, align 4, !dbg !40, !tbaa !26
  %7 = add nsw i32 %6, 1, !dbg !40
  store i32 %7, i32* @A, align 4, !dbg !40, !tbaa !26
  %8 = load i32, i32* @A, align 4, !dbg !41, !tbaa !26
  store i32 %8, i32* @B, align 4, !dbg !42, !tbaa !26
  %9 = load i32, i32* @B, align 4, !dbg !43, !tbaa !26
  %10 = add nsw i32 %9, -1, !dbg !43
  store i32 %10, i32* @B, align 4, !dbg !43, !tbaa !26
  %11 = load i32, i32* @A, align 4, !dbg !44, !tbaa !26
  %12 = add nsw i32 %11, -1, !dbg !44
  store i32 %12, i32* @A, align 4, !dbg !44, !tbaa !26
  br label %15, !dbg !45

13:                                               ; preds = %2
  %14 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2), !dbg !46
  br label %15

15:                                               ; preds = %13, %5
  br label %2, !dbg !37, !llvm.loop !47

16:                                               ; No predecessors!
  ret i8* undef, !dbg !49
}

; Function Attrs: nounwind uwtable
define i8* @dispose(i8* %0) #0 !dbg !50 {
  br label %2, !dbg !51

2:                                                ; preds = %14, %1
  br label %3, !dbg !51

3:                                                ; preds = %2
  %4 = load i32, i32* @B, align 4, !dbg !52, !tbaa !26
  %5 = icmp sgt i32 %4, 0, !dbg !53
  br i1 %5, label %6, label %12, !dbg !52

6:                                                ; preds = %3
  %7 = load i32, i32* @B, align 4, !dbg !54, !tbaa !26
  %8 = icmp eq i32 %7, 5, !dbg !55
  %9 = zext i1 %8 to i32, !dbg !55
  br i1 %8, label %__VERIFIER_assert.exit, label %10, !dbg !56

10:                                               ; preds = %6
  %11 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !58
  call void @abort() #6, !dbg !60
  unreachable, !dbg !60

__VERIFIER_assert.exit:                           ; preds = %6
  br label %14, !dbg !61

12:                                               ; preds = %3
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 5), !dbg !62
  br label %14

14:                                               ; preds = %12, %__VERIFIER_assert.exit
  br label %2, !dbg !51, !llvm.loop !63

15:                                               ; No predecessors!
  ret i8* undef, !dbg !65
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_602_001_main() #0 !dbg !66 {
  br label %1, !dbg !67

1:                                                ; preds = %11, %0
  %.0 = phi i32 [ 0, %0 ], [ %12, %11 ], !dbg !68
  %2 = icmp slt i32 %.0, 10, !dbg !69
  br i1 %2, label %3, label %13, !dbg !70

3:                                                ; preds = %1
  %4 = load i32, i32* @A, align 4, !dbg !71, !tbaa !26
  %5 = load i32, i32* @B, align 4, !dbg !72, !tbaa !26
  %6 = icmp eq i32 %4, %5, !dbg !73
  %7 = zext i1 %6 to i32, !dbg !73
  br i1 %6, label %__VERIFIER_assert.exit, label %8, !dbg !74

8:                                                ; preds = %3
  %9 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !76
  call void @abort() #6, !dbg !78
  unreachable, !dbg !78

__VERIFIER_assert.exit:                           ; preds = %3
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 3), !dbg !79
  br label %11, !dbg !80

11:                                               ; preds = %__VERIFIER_assert.exit
  %12 = add nsw i32 %.0, 1, !dbg !81
  br label %1, !dbg !70, !llvm.loop !82

13:                                               ; preds = %1
  ret i32 0, !dbg !83
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_602_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_602_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 3, column: 40, scope: !12)
!14 = !DILocation(line: 3, column: 39, scope: !12)
!15 = !DILocation(line: 3, column: 48, scope: !12)
!16 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 3, column: 58, scope: !12)
!18 = !DILocation(line: 3, column: 72, scope: !12)
!19 = !DILocation(line: 3, column: 84, scope: !12)
!20 = distinct !DISubprogram(name: "generate", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 12, column: 8, scope: !20)
!22 = !DILocation(line: 0, scope: !20)
!23 = !DILocation(line: 12, column: 14, scope: !20)
!24 = !DILocation(line: 12, column: 3, scope: !20)
!25 = !DILocation(line: 14, column: 7, scope: !20)
!26 = !{!27, !27, i64 0}
!27 = !{!"int", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C/C++ TBAA"}
!30 = !DILocation(line: 15, column: 7, scope: !20)
!31 = !DILocation(line: 17, column: 5, scope: !20)
!32 = !DILocation(line: 18, column: 3, scope: !20)
!33 = !DILocation(line: 12, column: 21, scope: !20)
!34 = distinct !{!34, !24, !32}
!35 = !DILocation(line: 19, column: 1, scope: !20)
!36 = distinct !DISubprogram(name: "process", scope: !8, file: !8, line: 21, type: !9, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 22, column: 3, scope: !36)
!38 = !DILocation(line: 24, column: 9, scope: !36)
!39 = !DILocation(line: 24, column: 11, scope: !36)
!40 = !DILocation(line: 25, column: 8, scope: !36)
!41 = !DILocation(line: 26, column: 11, scope: !36)
!42 = !DILocation(line: 26, column: 9, scope: !36)
!43 = !DILocation(line: 27, column: 8, scope: !36)
!44 = !DILocation(line: 28, column: 8, scope: !36)
!45 = !DILocation(line: 29, column: 5, scope: !36)
!46 = !DILocation(line: 31, column: 5, scope: !36)
!47 = distinct !{!47, !37, !48}
!48 = !DILocation(line: 32, column: 3, scope: !36)
!49 = !DILocation(line: 33, column: 1, scope: !36)
!50 = distinct !DISubprogram(name: "dispose", scope: !8, file: !8, line: 35, type: !9, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 37, column: 3, scope: !50)
!52 = !DILocation(line: 38, column: 9, scope: !50)
!53 = !DILocation(line: 38, column: 11, scope: !50)
!54 = !DILocation(line: 39, column: 11, scope: !50)
!55 = !DILocation(line: 40, column: 27, scope: !50)
!56 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !57)
!57 = distinct !DILocation(line: 40, column: 7, scope: !50)
!58 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !59)
!59 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !57)
!60 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !57)
!61 = !DILocation(line: 41, column: 5, scope: !50)
!62 = !DILocation(line: 43, column: 5, scope: !50)
!63 = distinct !{!63, !51, !64}
!64 = !DILocation(line: 44, column: 3, scope: !50)
!65 = !DILocation(line: 45, column: 1, scope: !50)
!66 = distinct !DISubprogram(name: "svp_simple_602_001_main", scope: !8, file: !8, line: 47, type: !9, scopeLine: 47, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 50, column: 8, scope: !66)
!68 = !DILocation(line: 0, scope: !66)
!69 = !DILocation(line: 50, column: 14, scope: !66)
!70 = !DILocation(line: 50, column: 3, scope: !66)
!71 = !DILocation(line: 53, column: 23, scope: !66)
!72 = !DILocation(line: 53, column: 28, scope: !66)
!73 = !DILocation(line: 53, column: 25, scope: !66)
!74 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !75)
!75 = distinct !DILocation(line: 53, column: 5, scope: !66)
!76 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !77)
!77 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !75)
!78 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !75)
!79 = !DILocation(line: 57, column: 5, scope: !66)
!80 = !DILocation(line: 58, column: 3, scope: !66)
!81 = !DILocation(line: 50, column: 20, scope: !66)
!82 = distinct !{!82, !70, !80}
!83 = !DILocation(line: 59, column: 3, scope: !66)
