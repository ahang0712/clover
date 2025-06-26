; ModuleID = 'svp_simple_326_001.bc'
source_filename = "./svp_simple_326_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@num = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_326_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  br label %4, !dbg !17

4:                                                ; preds = %7, %1
  %5 = load i32, i32* @num, align 4, !dbg !18, !tbaa !19
  %6 = icmp sgt i32 %5, 0, !dbg !21
  br i1 %6, label %7, label %13, !dbg !17

7:                                                ; preds = %4
  %8 = bitcast i32* %3 to i8*, !dbg !22
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #4, !dbg !22
  %9 = load i32, i32* @num, align 4, !dbg !23, !tbaa !19
  %10 = sub nsw i32 %9, 1, !dbg !24
  store i32 %10, i32* %3, align 4, !dbg !25, !tbaa !19
  %11 = load i32, i32* %3, align 4, !dbg !26, !tbaa !19
  store i32 %11, i32* @num, align 4, !dbg !27, !tbaa !19
  %12 = bitcast i32* %3 to i8*, !dbg !28
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #4, !dbg !28
  br label %4, !dbg !17, !llvm.loop !29

13:                                               ; preds = %4
  ret void, !dbg !30
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_326_001_isr_2(i8* %0) #0 !dbg !31 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  br label %4, !dbg !32

4:                                                ; preds = %7, %1
  %5 = load i32, i32* @num, align 4, !dbg !33, !tbaa !19
  %6 = icmp eq i32 %5, 0, !dbg !34
  br i1 %6, label %7, label %13, !dbg !32

7:                                                ; preds = %4
  %8 = bitcast i32* %3 to i8*, !dbg !35
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #4, !dbg !35
  %9 = load i32, i32* @num, align 4, !dbg !36, !tbaa !19
  %10 = sub nsw i32 %9, 1, !dbg !37
  store i32 %10, i32* %3, align 4, !dbg !38, !tbaa !19
  %11 = load i32, i32* %3, align 4, !dbg !39, !tbaa !19
  store i32 %11, i32* @num, align 4, !dbg !40, !tbaa !19
  %12 = bitcast i32* %3 to i8*, !dbg !41
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #4, !dbg !41
  br label %4, !dbg !32, !llvm.loop !42

13:                                               ; preds = %4
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_326_001_main() #0 !dbg !44 {
  store i32 1, i32* @num, align 4, !dbg !45, !tbaa !19
  %1 = load i32, i32* @num, align 4, !dbg !46, !tbaa !19
  %2 = icmp ne i32 %1, 1, !dbg !47
  br i1 %2, label %3, label %5, !dbg !46

3:                                                ; preds = %0
  br label %4, !dbg !48

4:                                                ; preds = %3
  call void @reach_error(), !dbg !49
  call void @abort() #5, !dbg !50
  unreachable, !dbg !50

5:                                                ; preds = %0
  ret i32 0, !dbg !51
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_326_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_326_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_326_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 10, column: 3, scope: !12)
!18 = !DILocation(line: 10, column: 10, scope: !12)
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !15, i64 0}
!21 = !DILocation(line: 10, column: 14, scope: !12)
!22 = !DILocation(line: 11, column: 5, scope: !12)
!23 = !DILocation(line: 11, column: 15, scope: !12)
!24 = !DILocation(line: 11, column: 18, scope: !12)
!25 = !DILocation(line: 11, column: 9, scope: !12)
!26 = !DILocation(line: 12, column: 9, scope: !12)
!27 = !DILocation(line: 12, column: 8, scope: !12)
!28 = !DILocation(line: 13, column: 3, scope: !12)
!29 = distinct !{!29, !17, !28}
!30 = !DILocation(line: 14, column: 1, scope: !12)
!31 = distinct !DISubprogram(name: "svp_simple_326_001_isr_2", scope: !8, file: !8, line: 17, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 20, column: 3, scope: !31)
!33 = !DILocation(line: 20, column: 10, scope: !31)
!34 = !DILocation(line: 20, column: 14, scope: !31)
!35 = !DILocation(line: 21, column: 5, scope: !31)
!36 = !DILocation(line: 21, column: 15, scope: !31)
!37 = !DILocation(line: 21, column: 18, scope: !31)
!38 = !DILocation(line: 21, column: 9, scope: !31)
!39 = !DILocation(line: 22, column: 9, scope: !31)
!40 = !DILocation(line: 22, column: 8, scope: !31)
!41 = !DILocation(line: 23, column: 3, scope: !31)
!42 = distinct !{!42, !32, !41}
!43 = !DILocation(line: 25, column: 1, scope: !31)
!44 = distinct !DISubprogram(name: "svp_simple_326_001_main", scope: !8, file: !8, line: 28, type: !9, scopeLine: 29, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 31, column: 7, scope: !44)
!46 = !DILocation(line: 33, column: 7, scope: !44)
!47 = !DILocation(line: 33, column: 10, scope: !44)
!48 = !DILocation(line: 34, column: 3, scope: !44)
!49 = !DILocation(line: 35, column: 13, scope: !44)
!50 = !DILocation(line: 35, column: 27, scope: !44)
!51 = !DILocation(line: 38, column: 3, scope: !44)
